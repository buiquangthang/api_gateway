User.create(email: "job@localhost.com", password: "Aa@123456", name: "joe")
service = Service.create(name: "Post service", url: "http://localhost:5001", token: "post-service-sample-token")
Route.create(service: service, verb: "get", url_pattern: "posts", version: "v1")
