from mccaskey/base-ubuntu-gcc6
maintainer Alex McCaskey <mccaskeyaj@ornl.gov>
run apt-get install -y libgmp-dev libmpfr-dev llvm-dev libclang-dev ruby ruby-dev rubygems 
run gem install --no-ri --no-rdoc fpm
run git clone https://github.com/ORNL-QCI/ScaffCC && cd ScaffCC && make
run cd /projects/ScaffCC && mkdir deb_build && cd deb_build && \
   mkdir -p usr/local/scaffold && cp -r ../build usr/local/scaffold \
   && cp -r ../Rotations usr/local/scaffold && cp -r ../scaffold usr/local/scaffold \
   && cp -r ../scripts usr/local/scaffold && cp -r ../scaffold.sh usr/local/scaffold/scaffcc && \
   fpm -s dir -t deb --name scaffold --version 2.0 --depends libgmp-dev --depends libmpfr-dev --depends llvm-dev --depends libclang-dev --depends libboost-all-dev --depends python --depends gcc-6 --depends g++-6 --description "Scaffold is a compiler for quantum computing built on LLVM and Clang" .
run cp /projects/ScaffCC/deb_build/*.deb /projects/ && rm -rf /projects/ScaffCC/deb_build

