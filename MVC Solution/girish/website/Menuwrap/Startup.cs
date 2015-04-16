using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Menuwrap.Startup))]
namespace Menuwrap
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
