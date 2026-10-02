using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using sugupuuRakendusXML.Models;

namespace sugupuuRakendusXML.Controllers;

public class HomeController : Controller
{
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
        ViewData["Title"] = "Sugupuu";
        ViewData["XmlFail"] = "ElisavetaSugupuu.xml";
        return View();
    }

    public IActionResult MinuSugupuu()
    {
        ViewData["Title"] = "Minu sugupuu";
        ViewData["XmlFail"] = "MinuSugupuu.xml";
        return View("Sugupuu");
    }

    public IActionResult XmlSkeem()
    {
        return View();
    }

    public IActionResult Reisid()
    {
        return View();
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
