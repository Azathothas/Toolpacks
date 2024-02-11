- #### Build Errors & Quirks
> - [Logs]()
> ```bash
> [-] Authentication failed --> # Invalid/Deleted GH Repos
> grep -B5 -A3 -in ".* Authentication failed .*" BUILD.log
> 
> [-] asset `*` not found --> # Eget failed to find that --asset
> grep -B5 -in "asset .* not found" BUILD.log
>
> [-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL
> awk '/Could not resolve host/{print prev; print; found=1} {prev=$0} /^\[+\]/{exit} END{if (!found) print prev}' BUILD.log
> 
> [-] command not found --> # Something failed to Install
> grep -in "command not found" BUILD.log
> 
> [-] No such file or directory # Usually Because Build Failures
> grep -in "No such file or directory" BUILD.log
>
> ```
