d=$(cat changes.css)
jupyter book build .
cp assets/images/* _build/html/_static/css
cd _build/
cd html/
find . -name '*.html' | while IFS=$'\n' read -r FILE; do
  var=' <header class="app-header">
    <div class="container-fluid">
      <div class="app-header-section">
        <!-- app brand -->
        <div class="app-brand">
          <a class="logo-aicrowd" href="#">
            <span>AIcrowd</span>
          </a>
        </div>
        <!-- /app brand -->
        <!-- search -->
        <!-- /search -->
      </div>
      <div class="app-header-section">
        <!-- app nav -->
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="#">Challenges</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Achievements</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Blog</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><svg width="16" height="4" xmlns="http://www.w3.org/2000/svg"><path d="M2 0C.9 0 0 .9 0 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zM8 0C6.9 0 6 .9 6 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" fill="#909293" fill-rule="nonzero"/></svg></a>
            <div class="dropdown-menu dropdown-menu-right">
              <a class="dropdown-item" href="#">Organize a challenge</a>
              <a class="dropdown-item" href="#">FAQ</a>
              <a class="dropdown-item" href="#">Contact</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Sign up</a>
            </div>
          </li>
        </ul>
        <!-- /app nav -->

        <!-- touch menu -->
        <div class="dropdown">
          <button class="app-header-toggler" type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="app-header-toggler-icon">
              <svg width="16" height="4" xmlns="http://www.w3.org/2000/svg"><path d="M2 0C.9 0 0 .9 0 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zM8 0C6.9 0 6 .9 6 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" fill="#909293" fill-rule="nonzero"/></svg>
            </span>
          </button>
          <div class="dropdown-menu dropdown-menu-right">
            <a class="dropdown-item" href="#">Challenges</a>
            <a class="dropdown-item" href="#">Achievements</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Blog</a>
            <a class="dropdown-item" href="#">Organize a challenge</a>
            <a class="dropdown-item" href="#">FAQ</a>
            <a class="dropdown-item" href="#">Contact</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Log in</a>
            <a class="dropdown-item" href="#">Sign up</a>
          </div>
        </div>
        <!-- /touch menu -->

        <!-- user options -->
        <div class="user-options">
          <button type="button" class="btn btn-secondary">Log in</button>
        </div>
        <!-- /user options -->
      </div>

    </div>
  </header>'

  b="$(readlink -f "$FILE")"
  echo "$b"
	while IFS= read -r line; do
    	echo "$line" >> tmp.txt
    	if [[ $line == *"<body"* ]]; then
   			echo "$var" >> tmp.txt
   	   	fi
	done < "$b"
	tail -n 1 "$b" >> tmp.txt
	cp tmp.txt "$b"
  	echo -n "" > tmp.txt

done
cd ..
cd html
cd _static/
cd css/

echo "$d" >> index.css
