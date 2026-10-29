p=r"F:\Coding_SMA\axo_exambro\main.html"
s=open(p,"r",encoding="utf-8").read()
replacements={
    "â‡©":"⇩", "âŒ":"⌁", "â†’":"→", "â—":"●", "â—·":"◷",
    "âš‘":"⚑", "â– ":"■", "â†":"←", " Â· ":" · ", "Â":"", "\u000b":" · "
}
for old,new in replacements.items():
    s=s.replace(old,new)
open(p,"w",encoding="utf-8",newline="").write(s)
