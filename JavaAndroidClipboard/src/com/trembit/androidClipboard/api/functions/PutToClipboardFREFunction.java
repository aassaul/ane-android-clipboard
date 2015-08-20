package com.trembit.androidClipboard.api.functions;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import com.adobe.fre.*;

import static android.content.Context.CLIPBOARD_SERVICE;

/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 20.08.2015
 * Time: 20:06
 */
public class PutToClipboardFREFunction implements FREFunction {
    @Override
    public FREObject call(FREContext freContext, FREObject[] freObjects) {
        try {
            FREArray freArray = (FREArray)freObjects[0];
            int[] codePoints = new int[(int)freArray.getLength()];
            for (int i = 0; i < codePoints.length; i++) {
                codePoints[i] = freArray.getObjectAt(i).getAsInt();
            }
            String value = new String(codePoints, 0, codePoints.length);
            Activity context = freContext.getActivity();
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(CLIPBOARD_SERVICE);
            ClipData clip = ClipData.newPlainText(value, value);
            clipboard.setPrimaryClip(clip);
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return null;
    }
}
