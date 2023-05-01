using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Common;
using System.Data.SQLite;
using System.Data.SQLite.EF6;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
 using System.Data.Entity.ModelConfiguration.Conventions;
 
 
namespace WindowsFormsApplication1
{
      public class SQLiteConfiguration : DbConfiguration
        {
            public SQLiteConfiguration()
            {
                //SetProviderFactory("System.Data.SQLite",  SqliteFactory.Instance);
                SetProviderFactory("System.Data.SQLite.EF6", SQLiteProviderFactory.Instance);
                SetProviderServices("System.Data.SQLite", (DbProviderServices)SQLiteProviderFactory.Instance.GetService(typeof(DbProviderServices)));
            }
        }
     
}
