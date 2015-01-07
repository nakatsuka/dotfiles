#content = $stdin.read
#print content
#
$stdin.each_line do |line|
	#p "#{$stdin.lineno}: #{line}"
	if /\$(?<head>[\w_])(?<body>[\w_]*)/ =~ line
		camel_name = head + body
		pascal_name = head.upcase + body
		print <<"EOS" % [pascal_name, camel_name]
	public function get%s()
	{
		return $this->%s;
	}
EOS
		print <<"EOS" % [pascal_name, camel_name]
	public function set%s($value)
	{
		$this->%s = $value;
	}
EOS
	end
end
