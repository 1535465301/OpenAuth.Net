// ***********************************************************************
// Assembly         : OpenAuth.Mvc
// Author           : yubaolee
// Created          : 10-26-2015
//
// Last Modified By : yubaolee
// Last Modified On : 10-26-2015
// ***********************************************************************
// <copyright file="AutofacExt.cs" company="www.cnblogs.com/yubaolee">
//     Copyright (c) www.cnblogs.com/yubaolee. All rights reserved.
// </copyright>
// <summary>IOC��ʼ��</summary>
// ***********************************************************************

using System.Reflection;
using System.Web.Mvc;
using Autofac;
using Autofac.Integration.Mvc;
using OpenAuth.App;
using OpenAuth.Domain.Interface;
using OpenAuth.Repository;

namespace OpenAuth.Mvc
{
    static internal class AutofacExt
    {
        public static void InitAutofac()
        {
            var builder = new ContainerBuilder();

            builder.RegisterType<UserRepository>().As<IUserRepository>();
            builder.RegisterType<OrgRepository>().As<IOrgRepository>();
            builder.RegisterType<LoginApp>();
            builder.RegisterType<OrgManagerApp>();

            // Register your MVC controllers.
            builder.RegisterControllers(typeof (MvcApplication).Assembly);

            // OPTIONAL: Register model binders that require DI.
            builder.RegisterModelBinders(Assembly.GetExecutingAssembly());
            builder.RegisterModelBinderProvider();

            // OPTIONAL: Register web abstractions like HttpContextBase.
            builder.RegisterModule<AutofacWebTypesModule>();

            // OPTIONAL: Enable property injection in view pages.
            builder.RegisterSource(new ViewRegistrationSource());

            // OPTIONAL: Enable property injection into action filters.
            builder.RegisterFilterProvider();

            // Set the dependency resolver to be Autofac.
            var container = builder.Build();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}