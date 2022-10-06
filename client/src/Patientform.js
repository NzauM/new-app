import { useState } from "react";

function Patientform() {
  const [patientData, setpatientData] = useState({});
  const [errors, showErrors] = useState([]);
  function handleInput(e) {
    console.log(`Input name ${e.target.name}`);
    console.log(`The value that the user entered is ${e.target.value}`);
    // let ourObject = {[e.target.name]: e.target.value}
    setpatientData({ ...patientData, [e.target.name]: e.target.value });
    // We can create our new patient from here.
  }
  console.log(patientData);

  function handleAddPatient(e) {
    e.preventDefault();
    fetch("/patients", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(patientData),
    }).then((res) => {
      console.log(res);
      if (res.ok) {
        res.json().then((data) => console.log(data));
      } else {
        res.json().then((response) => {
          console.log(response);
          showErrors(Object.values(response));
        });
      }
    });
  }
  console.log(errors);

  const errorsList = errors.map((err) => {
    return (
      <>
        <h1>{err}</h1>
      </>
    );
  });

  // const errorList = errors.map((elem,ind)=>{
  //   console.log(elem)
  //   return(
  //       <h1>{elem}</h1>
  //   )
  //  })
  return (
    <>
      {errors.length > 0 && <ul>{errorsList}</ul>}

      <form>
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
        <label htmlFor="cars">Choose a car:</label>
        <select onChange={(e)=>console.log(e.target.value)} name="specializations" id="cars" multiple>
          <option value="volvo">Volvo</option>
          <option value="saab">Saab</option>
          <option value="opel">Opel</option>
          <option value="audi">Audi</option>
        </select>
        <input onClick={handleAddPatient} type="submit" value="Submit" />
      </form>
    </>
  );
}
export default Patientform;
