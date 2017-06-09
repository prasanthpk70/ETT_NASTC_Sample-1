using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NASTC.Web.Client.Startup))]
namespace NASTC.Web.Client
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
