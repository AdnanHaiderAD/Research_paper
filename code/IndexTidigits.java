import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* This class creates a textfile where each line containes speaker id and digit class*/
public class IndexTidigits {
	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException{
		if (args==null ||args.length==1 ) throw new 	IOException("please specify the dirpath and output file path ");
		Pattern pattern =Pattern.compile("[1-9]a.wav");
		Matcher matcher;
		BufferedWriter writer = new BufferedWriter(new FileWriter(new File(args[1])));
		
		File dir= new File(args[0]);
		if (dir.isDirectory()){
			File[] genders =dir.listFiles();
			for (File gender: genders){
				if (gender.isDirectory()){
					File[] speakers = gender.listFiles();
					for (File speaker : speakers){
						if (speaker.isDirectory()){
							File[] speechFiles=speaker.listFiles();
							for (File speechfile:speechFiles){
								if (speechfile.isFile()){
									String filename= speechfile.getName();
									matcher=pattern.matcher(filename);
									if (matcher.matches()){
										writer.write(speaker.getName()+"\t"+speechfile.getName().charAt(0));
										writer.newLine();
										System.out.println(speechfile.getName().charAt(0));
									}	
								}
							}	
						}
					}	
				}
			}
						
		}else{
			throw new IOException("The first agrument must be a directory");
		}
		writer.flush();
		writer.close();
	}			
}
