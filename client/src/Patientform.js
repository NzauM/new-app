import { useState } from "react"

function Patientform() {
    const[patientData, setpatientData] = useState({})
    const [errors, showErrors] = useState([])
    function handleInput(e){
        console.log(`Input name ${e.target.name}`)
        console.log(`The value that the user entered is ${e.target.value}`)
        // let ourObject = {[e.target.name]: e.target.value}
        setpatientData({...patientData, [e.target.name]: e.target.value})
        // We can create our new patient from here.
    }
    console.log(patientData)

    function handleAddPatient(e){
        e.preventDefault()
        fetch("/patients", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(patientData)
        })
        .then((res)=>{
          if(res.ok){
            res.json().then((data)=>console.log(data))
          }
          else{
            res.json().then((res2)=>{
            console.log(Object.values(res2).join(''))
            showErrors(Object.values(res2).join(''))
          })
          }
        })
        console.log(errors)
        // .then((result)=>{
        //   console.log(result)
        // })
        // .then(()=>{
        //   then()
        // })
        
        // .then((res)=>{
        //   if(res.ok){
        //     console.log("Request okay")
        //   }
        //   else{
        //     console.log(res)
        //   }
          
        // })

    }
  return (
    <>
      <form >
        <label>
          First name:
          <input onBlur={handleInput} type="text" name="firstname" />
        </label>
        <label>
          Last Name:
          <input onBlur={handleInput} type="text" name="lastname" />
        </label>
        <label>
          Doctor id
          <input onBlur={handleInput} type="text" name="doctor_id" />
        </label>
        <label>
          Age
          <input onBlur={handleInput} type="text" name="age" />
        </label>
        <label>
          Gender
          <input onBlur={handleInput} type="text" name="gender" />
        </label>
        <input onClick={handleAddPatient} type='submit'  value="Submit" />
      </form>
    </>
  );
}
export default Patientform;
