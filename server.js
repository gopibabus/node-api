const express = require('express');

/*
|--------------------------------------------------------------------------
| Initialize App
|--------------------------------------------------------------------------
*/
const app = express();
app.set('view engine', 'ejs');
app.use(express.static("public"));
app.use(express.urlencoded());
app.use(express.json());

/*
|--------------------------------------------------------------------------
| Binding Routes
|--------------------------------------------------------------------------
*/
const webRouter = require('./routes/web');
const userRouter = require('./routes/users');
app.use('/', webRouter);
app.use('/users', userRouter);

app.listen(3000);