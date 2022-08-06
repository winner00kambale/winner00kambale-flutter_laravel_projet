<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;

class StudentController extends Controller
{
    public function index(){
        return Student::All();
    }
    public function destroy($id){
        $student = Student::find($id);
        return $student;
     }
}
