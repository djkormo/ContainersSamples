using System.IO;
using Microsoft.ML;
using Microsoft.ML.Runtime.Data;
using Microsoft.ML.Transforms;

namespace inference
{
    public class Predictor
    {
        private readonly MLContext _env;
        private readonly string _onnxFilePath;

        public Predictor(MLContext env, string onnxFilePath)
        {
            _env = env;
            _onnxFilePath = onnxFilePath;
        }

        public PredictionFunction<SearchData, FlatPrediction> GetPredictor()
        {
            var reader = TextLoader.CreateReader(_env,
                ctx => (
                    RateCode: ctx.LoadFloat(1),
                    PassengerCount: ctx.LoadFloat(2),
                    TripTime: ctx.LoadFloat(3),
                    TripDistance: ctx.LoadFloat(4)),
                separator: ',',
                hasHeader: true);
            var dummyTempFile = Path.GetTempFileName();
            var data = reader.Read(new MultiFileSource(dummyTempFile));

            var pipeline = new ColumnConcatenatingEstimator(_env, "Features", "RateCode", "PassengerCount", "TripTime", "TripDistance")
                .Append(new ColumnSelectingEstimator(_env, "Features"))
                .Append(new OnnxScoringEstimator(_env, _onnxFilePath, "Features", "Estimate"))
                .Append(new ColumnSelectingEstimator(_env, "Estimate"))
                .Append(new CustomMappingEstimator<RawPrediction, FlatPrediction>(_env, contractName: "OnnxPredictionExtractor",
                    mapAction: (input, output) =>
                    {
                        output.Estimate = input.Estimate[0];
                    }));

            var transformer = pipeline.Fit(data.AsDynamic);
            File.Delete(dummyTempFile);
            return transformer.MakePredictionFunction<SearchData, FlatPrediction>(_env);
        }
    }
}
