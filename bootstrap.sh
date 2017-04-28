#!/usr/bin/env bash

#Yum installs
yum -y install wget gcc-c++ gcc-gfortran

miniconda=Miniconda2-4.3.11-Linux-x86_64.sh
conda=/opt/anaconda/bin/conda
cd /vagrant
if [[ ! -f $miniconda ]]; then
    wget --quiet http://repo.continuum.io/miniconda/$miniconda
fi
chmod +x $miniconda
./$miniconda -b -p /opt/anaconda
chown -R vagrant /opt/anaconda

cat >> /home/vagrant/.bashrc << END
# add for anaconda install
PATH=/opt/anaconda/bin:\$PATH
END

$conda install -y pip pyyaml numpy scipy astropy pkg-config matplotlib ipython-notebook
$conda install -y -c openastronomy cfitsio=3.410 healpy=1.9.1
