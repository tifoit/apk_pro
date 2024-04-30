import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.stream.*;

public class dl_auto_check {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("请提供至少一个参数。");
            return;
        }

        // 定义要搜索的目录
        String sourceCodeDir = "./apks_dex";
        Set<String> keywords = new HashSet<>();
        for (String arg : args) {
            keywords.add(arg);
        }

        try (Stream<Path> stream = Files.walk(Paths.get(sourceCodeDir))) {
            stream.filter(Files::isRegularFile)
                    .forEach(file -> {
                        boolean containsKeywordInFileName = keywords.stream().anyMatch(keyword -> file.getFileName().toString().equalsIgnoreCase(keyword));
                        if (containsKeywordInFileName) {
                            System.out.println("找到文件: " + file);
                            try (BufferedReader reader = Files.newBufferedReader(file)) {
                                String line;
                                while ((line = reader.readLine()) != null) {
                                    for (String keyword : keywords) {
                                        if (line.toLowerCase().contains(keyword.toLowerCase())) {
                                            System.out.println("【文件】: " + file + " 【行】: " + line);
                                        }
                                    }
                                }
                            } catch (IOException e) {
                                System.err.println("读取文件时发生错误: " + file);
                                e.printStackTrace();
                            }
                        }
                    });
        } catch (IOException e) {
            System.err.println("访问目录时发生错误: " + sourceCodeDir);
            e.printStackTrace();
        }

        System.out.println("搜索完成。");
    }
}

