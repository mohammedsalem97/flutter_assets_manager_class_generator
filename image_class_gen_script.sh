
#input path should be like this 👉  C:/Users/HOME/Desktop/assets    🆗with / forward slash🆗  🛑 NOT \ back slash 🛑 


#*************************************************************************#
echo ;
echo Welcome to Flutter AssetsManager class generator 🤟 ;
echo Let\'s start!🔥;
echo ;
echo Enter the path of your image folder:;
echo "NOTE" the path of your image folder MUST contain only "forward slashes '/'", back slashes "'\'" are not allowed ;
echo e.g "C:/Users/HOME/Desktop/assets";
echo ;

read images_folder

cd ""$images_folder""
pwd
echo changed directory to $images_folder

#*The Output file name which will contain the class data
created_file="assets_manager.dart";
count=0;

#*create the output file
touch $created_file

#*overrwriting the existing contents in the output file if found 
echo "//*Flutter AssetsClassGenerator script." >  $created_file
echo "//* Created by Eng. Mohammed Salem" >>  $created_file
echo "//* Contact me at moahmedsalem51@gmail.com" >>  $created_file
echo "//* GitHub: https://github.com/mohammedsalem97" >>  $created_file
echo "" >>  $created_file
echo "" >>  $created_file

#*Defining the base folder for assets e.g [assets/] or [images/]
assets_path="assets/images/";
echo "const String assets_path='$assets_path';" >>  $created_file
echo "" >>  $created_file

#*list of file extensions in assets folder
extension_list='png jpg jpeg svg gif'

#*Defining the class
echo class AppAssets { >>  $created_file

#*Iterating over extensions list
for extension in $extension_list 
do 
echo "//*’Mapping $extension files..🔃"
echo "//* $extension files." >>  $created_file

#*creating a list containing files in the same directory with extension [$extension] 
yourfilenames=`ls *$extension`
# echo $yourfilenames

#*Iterating over filenames list to access file by file
for current_file in $yourfilenames
do
  
   #*replacing dashes '-' in the file name by underscore '_' , and removing the extension from its tail
   asset_name=($(echo $current_file | tr "-" "_"  | tr "./" " " ))
  #  echo "$asset_name"

  #*Appending the curent entry to the class as static const String member
  echo static const String $asset_name = "\"\$assets_path/$current_file\"" ";" >>  $created_file 

#*Incrementing the count of files mapped
  count=$(echo $(( count + 1 )));

done

  #*New line after finishing the array of files of type $extension 
  echo  "">>  $created_file
done

#*Closing curly braces of the class body
echo } >>  $created_file

echo ""
echo "Successfully created class with $count files..👌"

#*Beeeeeeeeep
echo -ne '\007'

#*Open output file in VScode... 😎
code $created_file

#*************************************************************************#

