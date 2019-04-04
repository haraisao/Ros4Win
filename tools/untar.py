#
#
import sys
import tarfile

def untar(fname, to_dir, num=40):
  mon=['-', '\\', '|', '/']
  try:
    arc=tarfile.open(fname)
    members=arc.getnames()

    n=len(members)
    x=n/num
    bar=">" + " " *num
    for i in range(n):
        arc.extract(members[i], path=to_dir)
        bar = "=" * int(i/x) + ">" + " " * int((n-i)/x)
        s="Extract: %s |%s|(%d%%) %s     \r" % (fname, bar, int(i*100/n), mon[i % 4])
        print(s, end="")
    print ("Extracted:",fname, "==>", to_dir, " " *(num+10))
    arc.close()
  except:
    print(fname,": Fail to extract...              ")
    try:
      arc.close()
    except:
      pass

if __name__ == '__main__':
    if len(sys.argv) < 2:
      print("Usage: %s <tgz file> <target dir>" % sys.argv[0])
    else:
      untar(sys.argv[1], sys.argv[2])
