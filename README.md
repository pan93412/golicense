# Golicense - Add LICENSE to your Go Program easier way!

## How to load the module?
- Download the latest source code, and `import (lic "./license")`.
- `go get (GitURL)`

## The architect of this module
```
- license (folder)
`-- license.go (module)
 `-- LicenseChecker()
     Check whether the license is broke.
     If yes, return `false`
     If no,  return `true`.
 `-- LicenseReader()
     Read the LICENSE content.
     If LICENSE file not found, the program
     will panic with message "ERROR: Invaild LICENSE file!"
`-- license.sh
    A tool to make LICENSE file. Get usage by `bash license.sh`.
    If you are a Windows user, you need to Google it.

    BTW, The generated LICENSE file needs to copy to the main program
    path.
```

## Author
- pan93412, 2018.
  - GitHub: <http://www.github.com/pan93412>
