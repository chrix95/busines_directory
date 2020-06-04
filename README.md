# INITSNG
A classic business directory service 

## Project setup
Ensure to clone the project into your local directory
1. Import the DB file `initsng.sql`
2. Duplicate the `.env.example` file and rename to `.env`
3. Set your DB parameter in the in the `.env` file
```
DB_DATABASE=DB_DATABASE_NAME
DB_USERNAME=DB_DATABASE_USERNAME
DB_PASSWORD=DB_DATABASE_PASSWORD
```
4. Generate your app key with the code below
```
php artisan key:generate
```
5. Run `composer install` to download the laravel dependencies, and also run `npm install` to download the vue dependencies.
6. Default Admin login credential:
```
Username: engchris95@gmail.com
Password: root1234
```
Note: During development phase, to compile your assets and watch for changes, run:
```
npm run watch
```
## Support
For support towards this project, reach me on <a href="tel:2348183780409">+2348183780409</a> or <a href="mailto:engchris95@gmail.com">email</a>.
