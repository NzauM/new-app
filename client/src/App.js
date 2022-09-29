import logo from './logo.svg';
import './App.css';
import {useEffect, useState} from 'react';
import Patientform from './Patientform';


function App() {
  const[name, setName] = useState("")
  const[patients, setPatients] = useState([])
  console.log("Entered the App component")
  // setName("Mercy")
  // /movies
  // useEffect(function, dependencyarray())
  // 1. nodepency array
        // useEffect(()=>{}) => run everytime the component is rerendered.
      // 2.Empty dependency array useEffect(()=>{},[]) => the side effect function, will run when the component is first rendered.
      // 3. Variables inside dependency array => Whenever this variable is changes, this side effect will be invoked

    useEffect(()=>{
      fetch("/patients")
      .then((res)=> res.json())
      .then((data)=>{
        // console.log(data)
        setPatients(()=>data)
      })
    },[])

    let patientsList = patients.map((elem, ind)=>{
      console.log(elem)
      return(
        <>
          <h1>{elem.firstname}</h1> 
        </>
      )
    })



    function handleAddName(e){
      console.log("We have reached the handler")
      // setName(e.target.value)
      setName(()=>e.target.value)      
    }

  
  return (
    <div className="App">
    <h1> Karibu </h1> 
    <input onBlur={handleAddName} type='text'></input>
    {patientsList}
    <Patientform/>
    </div> 
  );
}

export default App;
