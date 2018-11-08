package license
import ("io/ioutil"; "errors")

// A License Checker, You can call the program
// to check is the license removed.
// It will return a bool, true is "vaild",
// false is "invaild".
// If no responses, and we know the module
// may removed. :-(
func LicenseChecker() bool {
  ld, er := license()
  if ld != "" && len(ld) != 0 && er == nil {
    return true
  }
  return false
}

// The function will read LICENSE file and
// return the content of that file, if the
// LICENSE file invaild or not found it will
// panic the program.
func LicenseReader() string {
  lic, err := license()
  if err != nil {
    panic(errors.New("ERROR: Invaild LICENSE file!"))
  }
  return lic
}

// The function will read LICENSE file, and
// return the content of that file & error.  
func license() (string, error) {
  raw, err := ioutil.ReadFile("./LICENSE")
  if err != nil { return "", err }
  return string(raw), nil
}
