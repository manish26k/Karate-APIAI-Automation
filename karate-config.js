function fn() {
  var config = {};
  var env = karate.env || 'dev';

  if (env === 'qa') {
    config.baseUrl = 'https://dummyjson.com';
  } else {
    config.baseUrl = 'https://dummyjson.com';
  }

  return config;
}