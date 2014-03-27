function varargout = arrayFactorPlot(varargin)
% ARRAYFACTORPLOT M-file for arrayFactorPlot.fig
%      ARRAYFACTORPLOT, by itself, creates a new ARRAYFACTORPLOT or raises the existing
%      singleton*.
%
%      H = ARRAYFACTORPLOT returns the handle to a new ARRAYFACTORPLOT or the handle to
%      the existing singleton*.
%
%      ARRAYFACTORPLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARRAYFACTORPLOT.M with the given input arguments.
%
%      ARRAYFACTORPLOT('Property','Value',...) creates a new ARRAYFACTORPLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arrayFactorPlot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arrayFactorPlot_OpeningFcn via
%      varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arrayFactorPlot

% Last Modified by GUIDE v2.5 08-Jun-2012 07:01:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arrayFactorPlot_OpeningFcn, ...
                   'gui_OutputFcn',  @arrayFactorPlot_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before arrayFactorPlot is made visible.
function arrayFactorPlot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to arrayFactorPlot (see VARARGIN)

% Choose default command line output for arrayFactorPlot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes arrayFactorPlot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = arrayFactorPlot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

handles.AFdata.N = str2double(get(hObject,'String'));
plotAF(handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.AFdata.d = str2double(get(hObject,'String'));
plotAF(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

handles.AFdata.phi = str2double(get(hObject,'String'));
plotAF(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function out = plotAF(handles)

thisplot = false;

if isfield(handles,'AFdata')
    if isfield(handles.AFdata,{'N','d','phi'})
        thisplot = true;
    end
end

if ~thisplot
    return
end
    
psiMin = -2*pi*handles.AFdata.d + handles.AFdata.phi*pi/180;
psiMax = 2*pi*handles.AFdata.d + handles.AFdata.phi*pi/180;

psi = linspace(psiMin,psiMax,500);
AFpsi = abs((sin(psi*handles.AFdata.N/2)./sin(psi/2))/handles.AFdata.N);

axes(handles.axes1);
hold off;

%plot horizontal axis
plot([psiMin psiMax],[0 0],'b','linewidth',3);
hold on;

plot(psi,AFpsi,'linewidth',3);

theta = linspace(0,pi,400);
polarPsi = 2*pi*handles.AFdata.d*cos(theta)+handles.AFdata.phi*pi/180;
polarAF = abs((sin(polarPsi*handles.AFdata.N/2)./sin(polarPsi/2))/handles.AFdata.N);

%plot lines in correspondence of global maxima and nulls
psipos = ceil(psiMin/(2*pi/handles.AFdata.N))*2*pi/handles.AFdata.N:...
    (2*pi/handles.AFdata.N):floor(psiMax/(2*pi/handles.AFdata.N))*2*pi/handles.AFdata.N;

thetapos = acos((psipos-handles.AFdata.phi*pi/180)/(2*pi*handles.AFdata.d));

for cont=1:length(psipos)
   plot(handles.AFdata.phi*pi/180 +[0,2*pi*handles.AFdata.d*cos(thetapos(cont))],[0,-2*pi*handles.AFdata.d*sin(thetapos(cont))],'--k','linewidth',3);
   plot(handles.AFdata.phi*pi/180+2*pi*handles.AFdata.d*cos(thetapos(cont)) + [0,0],[0,-2*pi*handles.AFdata.d*sin(thetapos(cont))],':b','linewidth',3);
end

plot(handles.AFdata.phi*pi/180+cos(theta).*polarAF*2*pi*handles.AFdata.d,-sin(theta).*polarAF*2*pi*handles.AFdata.d,'r','linewidth',3);
plot(handles.AFdata.phi*pi/180 + cos(theta)*2*pi*handles.AFdata.d,-sin(theta)*2*pi*handles.AFdata.d,'k--','linewidth',3);

xlabel('\psi');

axis image

axes(handles.axes2);
[theta,phi] = ndgrid(linspace(0,pi,200),linspace(0,2*pi,50));

psi = 2*pi*handles.AFdata.d*cos(theta)+handles.AFdata.phi*pi/180;
AF = abs((sin(psi*handles.AFdata.N/2)./sin(psi/2))/handles.AFdata.N);

hold off;
leosphereplot(AF,theta,phi,1);
rotate3d on
