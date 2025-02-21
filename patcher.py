#!/usr/bin/python3
import subprocess

if __name__ == '__main__':
	# create index of files in bin image
	print('=============== CREATING BIN IMAGE FILE INDEX ===============')
	subprocess.run('java -jar tools/jpsxdec.jar -f bin/Prisoner\ \(Japan\).bin -x bin/prisoner.idx', shell = True)
	# extract game executable
	print('=============== EXTRACTING GAME EXECUTABLE/SCRIPT ===============')
	subprocess.run('java -jar tools/jpsxdec.jar -x bin/prisoner.idx -i 11 -dir exe/', shell = True)
	subprocess.run('mv exe/SLPS_023.87 exe/src_SLPS_023.87', shell = True)
	subprocess.run('java -jar tools/jpsxdec.jar -x bin/prisoner.idx -i 12 -dir exe/', shell = True)
	subprocess.run('mv exe/YEKJPK.DAT exe/src_YEKJPK.DAT', shell = True)
	# patch executable and script with code and text
	print('=============== PATCHING GAME EXECUTABLE/SCRIPT ===============')
	subprocess.run('wine tools/armips.exe main\.asm', shell = True)
	# reinsert patched executable
	print('=============== REINSERTING PATCHED GAME EXECUTABLE ===============')
	subprocess.run('wine tools/psxinject.exe -v bin/Prisoner\ \(Japan\)\.bin SLPS_023\.87 exe/SLPS_023\.87', shell = True)
	subprocess.run('wine tools/psxinject.exe -v bin/Prisoner\ \(Japan\)\.bin YEKJPK\.DAT exe/YEKJPK\.DAT', shell = True)
	subprocess.run('rm exe/*.DAT', shell = True)
	subprocess.run('rm exe/*.87', shell = True)
	# insert modified images
	print('=============== INSERTING IMAGES ===============')
	subprocess.run('tar xvzf pics/pics.tar.gz -C ./pics', shell = True)
	subprocess.run('java -jar tools/jpsxdec.jar -x bin/prisoner.idx -i 14 -replaceframes pics/prisoner-intro-frames.xml', shell = True)
	subprocess.run('java -jar tools/jpsxdec.jar -x bin/prisoner.idx -i 16 -replaceframes pics/prisoner-intro-frames.xml', shell = True)
	subprocess.run('java -jar tools/jpsxdec.jar -x bin/prisoner.idx -i 32 -replaceframes pics/prisoner-intro-frames.xml', shell = True)
	subprocess.run('java -jar tools/jpsxdec.jar -x bin/prisoner.idx -i 40 -replaceframes pics/prisoner-credits-frames.xml', shell = True)
	subprocess.run('rm bin/prisoner.idx', shell = True)
	subprocess.run('rm pics/*.bmp', shell = True)
	print('=============== SHOULD BE FINISHED ===============')
