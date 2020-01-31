%define debug_package %{nil}
%global pkg_version 0.11.1

Name:  brontosaurus-ponderosa
Version: %{pkg_version}
Release: 1%{?dist}
Summary: A hello world with two interesting words

Group: devel
License: Development/Libraries
URL:  https://github.com/TrevorFSmith/brontosaurus-ponderosa
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

BuildRequires: golang
BuildRequires: rsync

%description
Brontosaurus-pondorosa is a basic go app that Trevor F. Smith uses to test various deployment technologies in GitHub Actions.

%prep

%build
# Happens in rpmbuild/BUILD/
mkdir -p go
rsync -a ../../go/src go/
rsync -a ../../Makefile ./
make %{?_smp_mflags} VERSION=${RPM_PACKAGE_VERSION} tools

%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot} VERSION=${RPM_PACKAGE_VERSION}

%files
/usr/bin/brontosaurus-ponderosa
/usr/bin/ponderosa-brontosaurus

%clean
rm -rf %{buildroot}

%check
# cd go/src/github.com/TrevorFSmith/brontosaurus-ponderosa
make test
