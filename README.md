# WIP: Rails Mongoid Graphql

## About
Base template for Ruby on Rails projects. Built to minimize the time spent writing boilerplate code and performing repetitive setup tasks. Target for users who love using Graphql and Mongodb.

## Client Side JWT implementation
```javascript
// Header
var header = {
  "alg": "HS256", // algorithm used for the  signature
  "typ": "JWT"    // the type of token
};

// Claims
var claims = {
  "login": "JohnDoe",
  "password": "12345678"
};

// Signature
var payload = base64UrlEncode(header) + "." + base64UrlEncode(claims);
var signature = HMACSHA256(payload, 'my_secret');

// JWT
var myJWT = payload + "." + signature;
```

## Features
- [x] Auto Robocop Style Check
- [x] Auto Code Smell check
- [x] Faster Ruby with fasterer
- [ ] Authorization
- [x] JWT Authentication
- [ ] Test suits / Templates
- [ ] Custom Graphql Generator
- [x] Setup mongoid
- [x] Initialize Graphql
- [ ] Query samples
- [ ] Mutation samples
- [ ] Subscription samples
- [ ] I18n integration
- [ ] Gzip
- [ ] Server side rendering
- [ ] React Integration
- [ ] Admin Panel Integration
