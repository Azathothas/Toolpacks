- #### [What?](https://man7.org/linux/man-pages/man7/user_namespaces.7.html)
> - This is only relevant for packages from `.pkg`
> - The TLDR is that it's a way to isolate user and group IDs between processes, like creating a "mini operating system" inside the real operating system.
> - In a user namespace, a process can think it's running as the root user (with all the usual admin powers), but in reality, it's still a regular user outside of that namespace. 
> - This allows AppImages (& Variants) think they have full control, but in fact, they are limited to what the outer system allows.
> - Some distros like [Ubuntu](https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces) disable it using AppArmor for security: https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces
> - But you can disable that, and just use modern Sandboxing Tools like [BubbleWrap](https://github.com/containers/bubblewrap) & [firejail](https://github.com/netblue30/firejail). Or Wrappers like [AISAP]( https://github.com/mgord9518/aisap) & 
---

- #### [Check]()
```bash
!#Check if it's enabled at Kernel Level
sysctl -n user.max_user_namespaces
#This will print a number
#if it doesn't or it's user.max_user_namespaces = 0, then it's disabled

!#Check if it's enabled/restricted Using unshare : https://man7.org/linux/man-pages/man1/unshare.1.html
unshare --user echo "Username namespaces supported"
#If Suporrted: Username namespaces supported
#If Not: unshare: unshare(0x10000000): Operation not permitted

!#Check if AppArmor|SeLinux is stopping us 
sudo dmesg | grep -E '(selinux|apparmor|security)'
#Look for lines containing words like denied, disallowing etc
```
---

- #### [Enable]()
> - READ: https://www.baeldung.com/linux/kernel-enable-user-namespaces
> - You will also need to install [`uidmap`](https://command-not-found.com/newuidmap)
> - For [Ubuntu (AppArmor)](https://askubuntu.com/questions/1511854/how-to-permanently-disable-ubuntus-new-apparmor-user-namespace-creation-restric): https://askubuntu.com/questions/1511854/how-to-permanently-disable-ubuntus-new-apparmor-user-namespace-creation-restric
```bash
!#It will differ based on your Distro & Config, so seek help elsewhere

!#For Ubuntu/Debian & Variants [Default]
echo 'kernel.unprivileged_userns_clone=1' | sudo tee -a "/etc/sysctl.conf"
sudo service procps restart
sudo sysctl -p "/etc/sysctl.conf"
#Reboot

!#For Ubuntu/Debian & Variants [AppArmor]
echo 'kernel.apparmor_restrict_unprivileged_userns = 0' | sudo tee "/etc/sysctl.d/20-apparmor-donotrestrict.conf"
#Reboot
```
