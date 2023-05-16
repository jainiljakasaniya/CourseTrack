# Training App

The CourseTrack is a web-based LMS application that allows users to access courses and learn at their own pace. The app provides various features such as course management,  ratings, enrollments, module management, lesson management, and student blocking. The application is designed to be user-friendly, easy to navigate, and provide an excellent learning experience for users.

---
## Prerequisites

Make sure you have installed all of the following prerequisites on your machine:

- #### Node - [Download & Install Node.js](https://nodejs.org/en/download)
- #### PostgreSQL - [Download & Install PostgreSQL](https://www.postgresql.org/download/)

## Project Dependencies
   
   - bcrypt: 5.1.0
   - cookie-parser: 1.4.6
   - dotenv: 16.0.3
   - dotenv-safe: 8.2.0
   - express: 4.18.2
   - http-errors: 2.0.0
   - joi: 17.9.0
   - jsonwebtoken: 9.0.0
   - morgan: 1.10.0
   - pg: 8.10.0
   - swagger-jsdoc: 6.2.8
   - swagger-ui-express: 4.6.2

## Environment Variables

To run this project, you will need to add the environment variables which is listed in .env.example file to your .env file, which will be placed in the .config/ directory.

## Run Project Locally

Clone the project

```bash
$ git clone https://github.com/jainiljakasaniya/CourseTrack.git
```

Go to the project directory

```bash
$ cd CourseTrack
```

Install dependencies

```bash
$ npm install
```

Generate API Documentation

```bash
$ npm run docs
```

Start the server

```bash
$ npm start
```


## Tech Stack

**Database:** PostgreSQL

**Server:** Node.js, Express.js

