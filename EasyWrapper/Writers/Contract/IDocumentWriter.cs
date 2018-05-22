namespace EasyWrapper.Writers.Contract
{
    public interface IDocumentWriter : IWriter
    {
        string Template { get; set; }
    }
}
