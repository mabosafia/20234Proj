using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SQLite;
using System.Xml;
using System.Xml.Xsl;
using System.IO;
using System.Text.RegularExpressions;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            var context = new Seera_BooksEntities();
             
            var mpages = context.Pages.ToList();
            StreamReader xmlContent = new StreamReader(System.IO.Directory.GetCurrentDirectory() + "\\XMLFile1.xml");
            StreamReader XslContent = new StreamReader(System.IO.Directory.GetCurrentDirectory() + "\\XSLTFile1.xslt");
            string xsltempl = XslContent.ReadToEnd();
            for  (int i= 0 ; i< mpages.Count;i++)
            {
                string TextData = TransformXMLToHTML(mpages[i].TextData, xsltempl);
                string TextData2 = TransformXMLToHTML(mpages[i].TextData2, xsltempl);
                TextData = TextData.Replace("openrow", "<tr>");
                TextData = TextData.Replace("closerow", "</tr>");
                TextData2 = TextData2.Replace("openrow", "<tr>");
                TextData2 = TextData2.Replace("closerow", "</tr>");
                string tempSubj = GetString_forMatch("@@@[0-9 ]*@@@", TextData);
                if(tempSubj!="")
                     mpages[i].SubjectLinks = tempSubj;
                string tempGeg = GetString_forMatch("###[0-9 ]*###", TextData);
                if (tempGeg != "")
                    mpages[i].GegLinks = tempGeg;
                mpages[i].TextData_html = TextData;
                mpages[i].TextData2_html = TextData2;
            }
            context.SaveChanges();
           // webBrowser1.s
        }
        private string GetString_forMatch(string pattern,string data)
        {
            string result = "";
            // Create a Regex  
            Regex rg = new Regex(pattern);

              // Get all matches  
            MatchCollection matchedAuthors = rg.Matches(data);
            // Print all matched authors  
            if(matchedAuthors.Count>1)
            {
                int ss = 9;
                ss = 8;
            }
            for (int count = 0; count < matchedAuthors.Count; count++)
            {
                result = result + ( result != "" ? "$&" : "");
                result = result + matchedAuthors[count];
            }
            return result;
        }
        private static Dictionary<String, XslCompiledTransform> cachedTransforms = new Dictionary<string, XslCompiledTransform>();
        private static XslCompiledTransform GetAndCacheTransform(String xslt)
        {
            XslCompiledTransform transform;
            if (!cachedTransforms.TryGetValue(xslt, out transform))
            {
                transform = new XslCompiledTransform();
                using (XmlReader reader = XmlReader.Create(new StringReader(xslt)))
                {
                    transform.Load(reader);
                }
                cachedTransforms.Add(xslt, transform);
            }
            return transform;
        }
        public static string TransformXMLToHTML(string inputXml, string xsltString)
        {
            XslCompiledTransform transform = GetAndCacheTransform(xsltString);
            StringWriter results = new StringWriter();
            using (XmlReader reader = XmlReader.Create(new StringReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }
            return results.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //ummabook
            var context = new Umma_BooksEntities1();

            var mpages = context.Umma_Pages.ToList();
            StreamReader xmlContent = new StreamReader(System.IO.Directory.GetCurrentDirectory() + "\\XMLFile1.xml");
            StreamReader XslContent = new StreamReader(System.IO.Directory.GetCurrentDirectory() + "\\UmmaBookXsl.xsl");
            string xsltempl = XslContent.ReadToEnd();
            for (int i = 0; i < mpages.Count; i++)
            {
                string TextData = TransformXMLToHTML(mpages[i].TextData, xsltempl);
                string TextData2 = TransformXMLToHTML(mpages[i].TextData2, xsltempl);
                 mpages[i].TextData_html = TextData;
                mpages[i].TextData2_html = TextData2;
            }
            context.SaveChanges();

        }
    }
}
