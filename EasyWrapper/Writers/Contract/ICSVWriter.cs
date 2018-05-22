using System.Collections.Generic;

namespace EasyWrapper.Writers.Contract
{
    public interface ICSVWriter : IWriter
    {
        ICollection<string> Columns { get; }

        string Path { get; set; }

        void AddColumn(string column);

        void WriteRow(string row);

        void WriteRows(IEnumerable<string> rows);

        void WriteHeader();
    }
}
