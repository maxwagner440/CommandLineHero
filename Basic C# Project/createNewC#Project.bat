REM -- Set your projectName and the Directory you want this project to be made in

set projectName=DeltaForce
set directory=C:\Users

cd %directory%
mkdir %projectName%
cd %projectName%

REM -- Creates web package
dotnet new web -o %projectName%
dotnet new sln -n %projectName%

REM -- Create basic class libraries needed
dotnet new classlib -o %projectName%.Request.Handlers
dotnet new classlib -o %projectName%.Query.Handlers
dotnet new classlib -o %projectName%.Command.Handlers
dotnet new classlib -o %projectName%.Models
dotnet new classlib -o %projectName%.External.Models
dotnet new classlib -o %projectName%.Map.Profiles
dotnet new classlib -o %projectName%.Data.Access
dotnet new nunit -o %projectName%.Tests

REM -- Adds sln files
dotnet sln add %projectName%
dotnet sln add %projectName%.Request.Handlers
dotnet sln add %projectName%.Query.Handlers
dotnet sln add %projectName%.Command.Handlers
dotnet sln add %projectName%.Models
dotnet sln add %projectName%.External.Models
dotnet sln add %projectName%.Map.Profiles
dotnet sln add %projectName%.Data.Access
dotnet sln add %projectName%.Tests

REM -- Adding reference nuget packages to main web project
cd %projectName%
dotnet add reference ..\%projectName%.Request.Handlers\%projectName%.Request.Handlers.csproj

dotnet add package Microsoft.AspNetCore.Cors
dotnet add package Microsoft.AspNetCore.Mvc.Core
dotnet add package Microsoft.AspNetCore.Mvc.NewtonsoftJson
dotnet add package Microsoft.Extensions.Configuration.EnvironmentVariables
dotnet add package Microsoft.Extensions.DependencyInjection

dotnet add package FluentValidation.AspNetCore

dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection
dotnet add package MediatR.Extensions.Microsoft.DependencyInjection

dotnet add package Serilog
dotnet add package Serilog.Enrichers.AssemblyName
dotnet add package Serilog.Exceptions
dotnet add package Serilog.Exceptions.Hosting
dotnet add package Serilog.Settings.Configuration

dotnet add package Swashbuckle.AspNetCore
dotnet add package Swashbuckle.AspNetCore.Annotations
dotnet add package Swashbuckle.AWSApiGateway.Annotations
dotnet add package Swashbuckle.DocumentTags.Extension
dotnet add package Swashbuckle.Rebase.Extensions
dotnet add package Swashbuckle.Servers.Extension

REM -- Adding references for test package
cd ..\%projectName%.Tests
dotnet add reference ..\%projectName%.Models\%projectName%.Models.csproj




REM -- FEEL FREE TO ADD MORE REFERENCES OR PACKAGES HERE:


PAUSE


