FROM mcr.microsoft.com/dotnet/sdk:8.0 as build
WORKDIR /src
COPY ./MyWebApp.csproj ./
RUN dotnet restore "MyWebApp.csproj"
COPY . .
RUN dotnet publish ./MyWebApp.csproj -c Release -o /app/


FROM mcr.microsoft.com/dotnet/sdk:8.0 as final
WORKDIR /app
COPY --from=build /app/ .
ENTRYPOINT [ "dotnet", "MyWebApp.dll" ]
