var endPoint = {
  Services.auth: "http://192.168.0.108:8082/authenticate",
  Services.alien: "http://192.168.0.108:8082/alien",
  Services.posts: "http://192.168.0.108:8083/posts",
  Services.imageUpload: "http://192.168.0.108:8083/upload/image"
};

enum Services { auth, alien, posts, imageUpload }
