$path='F:\Coding_SMA\axo_exambro\main.html'
$lines=[IO.File]::ReadAllLines($path)
$login='function login(){const u=document.getElementById(''username'').value.trim(),p=document.getElementById(''password'').value,role=document.getElementById(''role'').value,a=get(''axo_accounts'',{}),pool=role===''operator''?a.operators:a.participants,user=pool.find(x=>x.username===u&&x.password===p);if(!user){toast(''Username atau password tidak sesuai untuk role ini.'',true);return}activeRole=role;activeUser=user;role===''operator''?renderOperator():renderParticipant()}'
for($index=0;$index -lt $lines.Count;$index++){
 if($lines[$index].StartsWith('function login(){')){$lines[$index]=$login}
}
[IO.File]::WriteAllLines($path,$lines,[Text.UTF8Encoding]::new($false))
