#!/usr/bin/env python3
#
from __future__ import print_function
import tarfile
import os.path
import sys
import xml.dom.minidom
import glob

pkg_list=['ros_base', 'ros_desktop', 'control', 'plan', 'navigation']

def getPkgInfo(lst):
  for v in lst:
    if 'package.xml' in v:
      return v

def getPackageXml(fname):
  arc=tarfile.open(fname)
  lst = arc.getnames()
  info = arc.extractfile(getPkgInfo(lst)).read()
  arc.close()
  return info.decode('utf-8')

def getPackage(fname):
  pkg_dom=dom=xml.dom.minidom.parseString(getPackageXml(fname))
  return pkg_dom

def getRun_dep(dom):
  deps =  dom.getElementsByTagName('run_depend')
  deps += dom.getElementsByTagName('exec_depend')
  deps += dom.getElementsByTagName('depend')
  res=[]
  for x in deps:
    try:
      res.append(x.childNodes[0].data)
    except:
      pass
  return res

def get_run_dep(name):
  arg=find_package(name)
  if not arg : return []
  (pkgname, name) = arg
  fname="%s/ros-melodic-%s.tgz" % (pkgname, name.replace('_', '-'))
  dom=getPackage(fname)
  return getRun_dep(dom)

def get_file_name(name):
  return "ros-melodic-"+name.replace('_', '-')+".tgz"

def get_file_list(pkg):
  return glob.glob("%s/*.tgz" % pkg)

def merge_list(val, res):
  r=False
  try:
    for v in val:
      if not v in res:
        res.append(v)
        r=True
  except:
    pass
  return r

def get_all_file(pkgs=pkg_list):
  res=[]
  for x in pkgs:
    flist=get_file_list(x)
    merge_list(flist, res)

  return res

def find_package(name, pkgs=pkg_list):
  fname="ros-melodic-%s.tgz" % name.replace('_', '-')
  for x in pkgs:
    if os.path.exists("%s/%s" % (x, fname)):
       return (x, name)
  return None

def get_run_dep_all(name, pkg_list, lib_list):
  lst = get_run_dep(name)
  if not lst : return pkg_list

  for p in lst:
    if not p in pkg_list:
      if find_package(p) :
        pkg_list.append(p)
        get_run_dep_all(p, pkg_list, lib_list)
      else:
        if not p in lib_list :
          lib_list.append(p)
  return pkg_list

def pkg_dep_main():
  pkgs=[]
  libs=[]
  if find_package(sys.argv[1]) :
    get_run_dep_all(sys.argv[1], pkgs, libs)
    print ("Package:", pkgs)
    print ("Libraries:", libs)
  else:
    print("Package '%s' not found." % sys.argv[1])

def get_pkg_name(pth):
  fname=pth+"/package.xml"
  pkg_dom=dom=xml.dom.minidom.parse(fname)
  name = pkg_dom.getElementsByTagName('name')
  try:
    return name[0].childNodes[0].data
  except:
    return pth

if __name__ == '__main__':
  #pkg_dep_main()
  print(get_pkg_name(sys.argv[1]))
