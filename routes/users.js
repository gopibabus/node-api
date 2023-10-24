const express = require('express');
const {logger} = require('../middleware/index');

/*
|--------------------------------------------------------------------------
| Initialize Router
|--------------------------------------------------------------------------
*/
const router = express.Router();
router.use(logger);

/*
|--------------------------------------------------------------------------
| User Routes
|--------------------------------------------------------------------------
*/
router.get('/', (req, res) => {
    res.send("User List");
});

router.get('/new', (req, res) => {
    res.send("User New Form");
});

router.post('/', (req, res) => {
    res.send("Create User");
});

router.get('/:id', (req, res) => {
    res.send(`User of id ${req.params.id}`);
});

module.exports = router;