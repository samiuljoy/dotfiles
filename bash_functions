#!/usr/bin/env sh
tt () {
	testdir="/home/$USER/tests/"
	case "$1" in
		"") echo "No arguments provided"
			return 1
			break
			;;
		c|C) cd $testdir/c/
			;;
		shell|s) cd $testdir/shell-scripts/
			;;
		text|t|txt) cd $testdir/text-files/
			;;
		web|w) cd $testdir/temp-web-stuff/
			;;
		ww) cd $testdir/web-test/
			;;
		audio) cd $testdir/audio/
			;;
		android|a) cd $testdir/android-tests/
			;;
		m|md) cd $testdir/markdown/
			;;
		*) echo "invalid string"
			return 1
			break
			;;
	esac
}
gg () {
	ghdir="/home/$USER/git/github/"
	case "$1" in
		"") cd $ghdir
			;;
		s|sg) cd $ghdir/personal-site-generator/
			;;
		sf ) cd $ghdir/personal-site-generator/dir/final-test/
			;;
		q) cd $ghdir/quran/
			;;
		md) cd $ghdir/markdown-to-html/
			;;
		dwm) cd $ghdir/minimal-dwm-ricing/
			;;
		dot|d ) cd $ghdir/dotfiles/
			;;
		morse ) cd $ghdir/morse-code-decode/
			;;
		sam ) cd $ghdir/sam/md/
			;;
		ssg ) cd $ghdir/ssg/
			;;
		anon ) cd $ghdir/anonymouskun-ssg
			;;
		*) echo "invalid string"
			return 1
			break
			;;
	esac
}
cs() {
	cd "$@" && ls
}
apkd() {
	apktoool="$(ls | grep apktool.*jar)"

	[ $(ls | grep apktool) ] && java -jar $apktoool d "$1" || echo "apktool.jar is absent in $PWD"
}
apkb() {
	apktoool="$(ls | grep apktool.*jar)"
	[ ! -f "apktool_2.5.0.jar" ] && \
		echo "apktool jarfile is absent" && \
		return 1
	[ -z "$1" ] && \
		echo "empty dir name" && \
		return 1
	[ -z "$2" ] && \
		echo "empty output name" && \
		return 1
	# if everything above succeeds
	java -jar $apktoool b --use-aapt2 "$1" -o "$2"
}
r() {
	filename="$1"
	[ -f "$filename" ] && vim -p $(cat $filename) || echo "$filename not found"
}
#c() {
#	cd $(fzf | sed 's/\(.*\)\/.*/\1/g')
#}
