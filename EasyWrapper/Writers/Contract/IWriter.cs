namespace EasyWrapper.Writers.Contract
{
    public interface IWriter
    {
        void Write(string content, string path);

        void WriteAsync(string content, string path);
    }
}
