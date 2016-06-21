#!/bin/bash

pname=${PWD##*/}
file=$pname.project

cat << EOT > $file
<?xml version="1.0" encoding="UTF-8"?>
<CodeLite_Project Name="$pname" InternalType="CPPP">
  <Plugins>
    <Plugin Name="qmake">
      <![CDATA[00010001N0005Debug000000000000]]>
    </Plugin>
    <Plugin Name="CMakePlugin">
      <![CDATA[[{
  "name": "Debug",
  "enabled": false,
  "buildDirectory": "build",
  "sourceDirectory": "\$(ProjectPath)",
  "generator": "",
  "buildType": "",
  "arguments": [],
  "parentProject": ""
 }]]]>
    </Plugin>
  </Plugins>
  <Description/>
  <Dependencies/>
  <Settings Type="Dynamic Library">
    <GlobalSettings>
      <Compiler Options="" C_Options="" Assembler="">
        <IncludePath Value="."/>
      </Compiler>
      <Linker Options="">
        <LibraryPath Value="."/>
      </Linker>
      <ResourceCompiler Options=""/>
    </GlobalSettings>
    <Configuration Name="Debug" CompilerType="clang( based on LLVM 3.5.0 )" DebuggerType="GNU gdb debugger" Type="Dynamic Library" BuildCmpWithGlobalSettings="append" BuildLnkWithGlobalSettings="append" BuildResWithGlobalSettings="append">
      <Compiler Options="-g" C_Options="-g" Assembler="" Required="yes" PreCompiledHeader="" PCHInCommandLine="no" PCHFlags="" PCHFlagsPolicy="0">
        <IncludePath Value="."/>
      </Compiler>
      <Linker Options="" Required="yes"/>
      <ResourceCompiler Options="" Required="no"/>
      <General OutputFile="" IntermediateDirectory="./Debug" Command="" CommandArguments="" UseSeparateDebugArgs="no" DebugArguments="" WorkingDirectory="" PauseExecWhenProcTerminates="yes" IsGUIProgram="no" IsEnabled="yes"/>
      <Environment EnvVarSetName="&lt;Use Defaults&gt;" DbgSetName="&lt;Use Defaults&gt;">
        <![CDATA[]]>
      </Environment>
      <Debugger IsRemote="no" RemoteHostName="" RemoteHostPort="" DebuggerPath="" IsExtended="no">
        <DebuggerSearchPaths/>
        <PostConnectCommands/>
        <StartupCommands/>
      </Debugger>
      <PreBuild/>
      <PostBuild/>
      <CustomBuild Enabled="yes">
        <Target Name="Program board">make flash_main</Target>
        <RebuildCommand>make clean &amp;&amp; make all</RebuildCommand>
        <CleanCommand>make clean</CleanCommand>
        <BuildCommand>make all</BuildCommand>
        <PreprocessFileCommand/>
        <SingleFileCommand>make \$(CurrentFileName).o</SingleFileCommand>
        <MakefileGenerationCommand/>
        <ThirdPartyToolName>None</ThirdPartyToolName>
        <WorkingDirectory>\$(ProjectPath)</WorkingDirectory>
      </CustomBuild>
      <AdditionalRules>
        <CustomPostBuild/>
        <CustomPreBuild/>
      </AdditionalRules>
      <Completion EnableCpp11="no" EnableCpp14="no">
        <ClangCmpFlagsC/>
        <ClangCmpFlags/>
        <ClangPP/>
        <SearchPaths>/home/cppp/CPPP/Repos/tud-cpp-exercises/lib/uc_includes;
/home/cppp/CPPP/Repos/tud-cpp-exercises/lib/16FXlib;
/home/cppp/CPPP/Repos/tud-cpp-exercises/lib/16FXlib/can;</SearchPaths>
      </Completion>
    </Configuration>
  </Settings>
  <VirtualDirectory Name="resources">
    <File Name="Makefile"/>
  </VirtualDirectory>
  <VirtualDirectory Name="src">
EOT

files=$(find . -maxdepth 1 -iregex '.*\(c\|h\)' -printf '%f\n')
for f in $files; do
echo "    <File Name=\"$f\"/>" >> $file
done

cat << EOT >> $file
  </VirtualDirectory>
</CodeLite_Project>
EOT
