using System.Diagnostics;
using System.Xml.Linq;
using System.Xml.Xsl;
using Microsoft.AspNetCore.Mvc;
using sugupuuRakendusXML.Models;

namespace sugupuuRakendusXML.Controllers;

public class HomeController : Controller
{
    private readonly IWebHostEnvironment _env;

    public HomeController(IWebHostEnvironment env)
    {
        _env = env;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Teooria()
    {
        return View();
    }

    public IActionResult Sugupuu()
    {
        var xslt = new XslCompiledTransform();
        xslt.Load(Path.Combine(_env.WebRootPath, "sugupuuParing.xslt"));

        var args = new XsltArgumentList();
        args.AddParam("aasta", "", DateTime.Now.Year);

        using var writer = new StringWriter();
        xslt.Transform(Path.Combine(_env.WebRootPath, "ElisavetaSugupuu.xml"), args, writer);

        ViewBag.Puu = writer.ToString();
        return View(XDocument.Load(Path.Combine(_env.WebRootPath, "ElisavetaSugupuu.xml")));
    }

    public IActionResult Kontakt()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
