<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Auth;

// class UserController extends Controller
// {
//     public function store(Request $request){
//         User::create([
//             'name'=> $request->name,
//             'email'=> $request->email,
//             'password'=> \bcrypt($request->password),
//         ]);
//         return \response()->json('User registered');
//     }

//     public function login(Request $request){
//         if(Auth::attempt(['email'=>$request->email,'password'=>$request->password])){
//             return \response()->json(['Token'=>auth()->user()->createToken('API Token')->plainTextToken]);
//         }
//         return \response()->json(['message'=>'Login failled','failed'=>true]);
//     }

//     public function logout(){
//         auth()->user()->tokens()->delete();
//         return \response()->json(['Logged out']);
//     }
// }
// use App\Models\User;

class UserController extends Controller
{
    
    public function index()
    {
        //
    }

    
    public function create()
    {
        //
    }

   
    public function store(Request $req)
    {
        $rules = [
            'name' => 'required|string',
            'email' => 'required|string|unique:users',
            'password' => 'required|string|min:6'
        ];
        $validator = Validator::make($req->all(),$rules);
        if($validator->fails()){
            return response()->json($validator->errors(),400);
        }
        $user = User::create([
            'name'=>$req->name,
            'email'=>$req->email,
            'password'=>Hash::make($req->password)
        ]);
        $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['user' =>$user, 'token' =>$token];
        return response()->json($response,200);
    }

    public function login(Request $req){
        //validate
        $rules = [
            'email' => 'required',
            'password' => 'required',
        ];
        $req->validate($rules);
        $user = User::where('email',$req->email)->first();
        if ($user && hash::check($req->password, $user->password) ) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['user' =>$user, 'token' =>$token];
            return response()->json($response, 200);
        }
        $response = ['message'=>'Incorrect mail or password'];
        return response()->json($response, 400);
    }


   
    public function show($id)
    {
        //
    }

    
    public function edit($id)
    {
        //
    }

   
    public function update(Request $request, $id)
    {
        //
    }

    
    public function destroy($id)
    {
        //
    }
}
