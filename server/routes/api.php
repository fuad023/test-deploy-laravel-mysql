<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

Route::get('/test', function () {
    return [
        'success' => true,
        'message' => 'Hello from Laravel.'
    ];
});

Route::get('/users', function () {
    $users = DB::select('
        SELECT name FROM users;
    ');

    return [
        'success' => true,
        'users' => $users
    ];
});

Route::post('/users', function (Request $request) {
    $name = $request->name;
    $success = DB::insert('
        INSERT INTO users (name)
        VALUES (?);
    ', [$name]);

    return [
        'success' => $success
    ];
});
