## To use this application you should do the following steps:
### preparation:

1. Clone repository: `git clone https://github.com/gunnner/help_animals.git`
2. Install `docker` and `docker-compose`
3. Create a `.env` file and fill it according to `.env.example`</br>For `JWT_TOKEN` you can use any string, but for convenience might get it with one click here: https://replit.com/@IhorBohdan/SubstantialFumblingCodeview
4. Build the app: `docker-compose build`
5. Create databases with `docker-compose run --rm app rails db:create`
6. Migrate created database with `docker-compose run --rm app rails db:migrate`
7. Create admin user with `docker-compose run --rm app rails db:seed`

### usage:

1. Start the app: `docker-compose up`
2. Go to `localhost:3000/admin`
3. Login with default admin credentials: `email: admin@example.com`, `password: password`
4. Create any user/animal you want
5. Send POST with your user credentials to `localhost:3000/login`
6. As a response you will get a token which you should send inside of each following request's header
