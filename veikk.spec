Name:    veikk-a15-driver
Version: 1
Release: 1%{?dist}
Summary: Veikk A15 driver
BuildRequires:  %{_bindir}/make %{_bindir}/gcc
Group:          System Environment/Kernel

License: Public Domain

%description
Driver for Veikk A15

%build
cp -r src /etc/veikk-a15 && cd /etc/veikk-a15 && make clean

%install
mkdir -p %{buildroot}/etc
cp -r /etc/veikk-a15 %{buildroot}/etc/veikk-a15

%post
cd /etc/veikk-a15 && make && make install

%files
/etc/veikk-a15

%changelog

