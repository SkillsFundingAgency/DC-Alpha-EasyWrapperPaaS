using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace EasyWrapper.Executor.Service
{
    public class GetRulebases : IGetRulebases
    {
        public GetRulebases()
        {
            string path = Path.Combine(AppContext.BaseDirectory, "ExecConfig.xml");
            var xd = XDocument.Load(path);
            Calculations = GetContents(xd, "Calculation").ToList();
            Validations = GetContents(xd, "Validation").ToList();
        }

        public IEnumerable<string> GetContents(XDocument document, string ruleGroup)
        {
            return document
                .Descendants(ruleGroup)
                .SelectMany(x => x.Descendants("Rulebases"))
                .SelectMany(y => y.Descendants("Rulebase"))
                .Select(z => z.Value);
        }

        public IEnumerable<string> Calculations { get; set; }

        public IEnumerable<string> Validations { get; set; }
    }
}
