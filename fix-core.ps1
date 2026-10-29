$p='F:\Coding_SMA\axo_exambro\main.html'
$s=[IO.File]::ReadAllText($p)
$login='function login(){const u=$(''username'').value.trim(),p=$(''password'').value,role=$(''role'').value,a=get(''axo_accounts'',{}),pool=role===''operator''?a.operators:a.participants,user=pool.find(x=>x.username===u&&x.password===p);if(!user){toast(''Username atau password tidak sesuai untuk role ini.'',true);return}activeRole=role;activeUser=user;role===''operator''?renderOperator():renderParticipant()}'
$s=[regex]::Replace($s,'(?m)^function login\(\).*?$',$login)
$save='function saveParticipant(i){const name=$(''pName'').value.trim(),cl=$(''pClass'').value.trim();if(!name||!cl)return toast(''Nama peserta dan kelas wajib diisi.'',true);const a=get(''axo_accounts'',{});if(i!==null&&i!==''' '''&&i!=null){Object.assign(a.participants[i],{name,class:cl});toast(''Data peserta berhasil diperbarui'')}else{const username=nextParticipantUsername(),password=generateParticipantPassword();a.participants.push({name,class:cl,username,password});toast(''Peserta dibuat · Username: ''+username+'' · Password: ''+password)}set(''axo_accounts'',a);closeOverlay();renderParticipantAdmin($(''operatorContent''))}'
$s=[regex]::Replace($s,'(?m)^function saveParticipant\(i\).*?$',$save)
[IO.File]::WriteAllText($p,$s,[Text.UTF8Encoding]::new($false))
