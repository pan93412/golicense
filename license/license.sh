#!/usr/bin/env bash
# Add licenses into your Go program easier way!
#            == How to use ==
# You can `bash license.sh GPL3` to generate
# GPL3 License, `bash license.sh MIT` to generate
# MIT License, `bash license.sh unlicense` to generate
# Unlicense, also, you can choose `bash license.sh empty`
# to manual add the license into the LICENSE
# file.
#
# The LICENSE source is bulit-in in the program, you can
# edit LICENSE template by editing the source code.

# GPL3 License
function gpl3 {
  year=$(date +%Y)
  cat >> LICENSE << EOF
Copyright (C) $year $1

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
EOF
}

# MIT LICENSE
function mit {
  year=$(date +%Y)
  cat >> LICENSE << EOF
Copyright (C) $year $1

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
EOF
}

# Unlicense LICENSEs
function unlic {
  cat >> LICENSE << EOF
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
EOF
}

# FileChecker
if [[ ! -e LICENSE ]]
then
  echo > LICENSE
fi

# ArgChecker
if [[ $1 == "GPL3" ]]
then
  read -p "Type your name: " name
  echo > LICENSE
  gpl3 $name
elif [[ $1 == "MIT" ]]
then
  read -p "Type your name: " name
  echo > LICENSE
  mit $name
elif [[ $1 == "unlicense" ]]
then
  echo > LICENSE
  unlic
elif [[ $1 == "empty" ]]
then
  echo > LICENSE
else
  echo "Usage: bash $0 {GPL3|MIT|unlicense|empty}"
  exit 1
fi

echo "Remember to copy LICENSE file to the build folder!"

