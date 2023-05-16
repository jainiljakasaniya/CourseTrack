module.exports = {
  info: {
    title: 'CourseTrack : E-learning Service',
    version: '0.0.1',
    description: 'CourseTrack API documentation',
  },
  host: 'localhost:3000',
  basePath: '/',
  apis: ['./../../routes/*.route.js'],
  schemes: ['http'],
  consumes: ['application/json'],
  produces: ['application/json'],
};
